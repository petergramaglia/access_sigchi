/*
FILE: metadata.js
PURPOSE: This script allows for editing of a given pdf's metadata. Since pdflib
         doesn't allow manipulation of metadata from the same pdf, the logic
         is to create a copy of the pdf with the new metadata.
NOTE:

Last Modified: 06/13/2020 (Finished 06/12/2020, Testing 06/13/2020)
*/

var pdflib = require("pdf-lib")
var fs = require("fs")
const readline = require('readline');

/* This function prints out the metadata from a given pdf file stream */
async function metadata(file_stream) {

    // Parse the stream into pdf-lib's format
    const pdfFile = await pdflib.PDFDocument.load(file_stream, { 
        updateMetadata: false 
    })

    // Print all metadata. If we want more or less, we can simply remove lines
    console.log('Title:', pdfFile.getTitle())
    console.log('Author:', pdfFile.getAuthor())
    console.log('Subject:', pdfFile.getSubject())
    console.log('Creator:', pdfFile.getCreator())
    console.log('Keywords:', pdfFile.getKeywords())
    console.log('Producer:', pdfFile.getProducer())
    console.log('Creation Date:', pdfFile.getCreationDate())
    console.log('Modification Date:', pdfFile.getModificationDate())

    return pdfFile
}

/* Opens a given file name, checks if file opening was successful, and 
   passes on the file stream to be edited */
async function openFile(file_name, editMetadata) {

    // Use fs to open a file for reading, catches error
    file_stream = fs.readFileSync(file_name, (err, data) => {
        if (err) console.log(err)
        file_stream = data
    })

    // Prints metadata of pdf, and sends it for editing
    const pdfFile = await metadata(file_stream)
    editMetadata(pdfFile)
}

/* Edits one metadata entry of choice. Will copy the changed metadata into a new
   file and save it locally. Will check for errors in metadata category name,
   and if file writing was successful */
async function editMetadata(pdfFile) {

    /* Both prompts ask for which metadata, and what to change it to. Gives
       users option to exit */
    const ans = await editPrompt("\nWhat metadata do you want to edit? (exit to leave) ");
    if (ans == "exit")
        return
    const choice = await editPrompt("\nInput new " + ans + " (exit to leave): ");
    if (choice == "exit")
        return

    // Create new pdf document for the accessible pdf output
    const output_pdf = await pdflib.PDFDocument.create()

    // Set the font to Times Roman for now.
    const output_font = await output_pdf.embedFont(pdflib.StandardFonts.TimesRoman)

    // Add a blank page for now.
    const page = output_pdf.addPage([500, 600])
    page.setFont(output_font)

    // Copy all metadata to new file
    copyMetadata(pdfFile, output_pdf)

    switch(ans) {
        case "Title":
            output_pdf.setTitle(choice)
            break
        case "Author":
            output_pdf.setAuthor(choice)
            break
        case "Subject":
            output_pdf.setSubject(choice)
            break
        case "Creator":
            output_pdf.setCreator(choice)
            break
        case "Keywords":
            output_pdf.setKeywords(choice)
            break
        case "Producer":
            output_pdf.setProducer(choice)
            break
        case "Creation Date":
            output_pdf.setCreationDate(choice)
            break
        case "Modification Date":
            output_pdf.setModificationDate(choice)
            break

        // Catches all cases where metadata category was invalid.
        default:
            console.log("\nMetadata category(" + ans + ") was incorrect. Try again")
            editMetadata(output_pdf)
            return
    }

    /* Save pdf-lib stream into a file stream.

       NOTE: This file stream can be processed flexibly:
        1. Written to a local file (Done here)
        2. Downloaded straight from the web
        3. Displayed in iframe, or some other application */
    const pdfBytes = await output_pdf.save()

    await fs.writeFile('output.pdf', pdfBytes, err => {
        if (err) return console.log(err)
    })

    console.log("\nUpdated.")
}

/* This function simply copies all metadata from one pdf to another */
async function copyMetadata(source, output) {
    output.setTitle(source.getTitle())
    output.setAuthor(source.getAuthor())
    output.setProducer(source.getProducer())
    output.setKeywords(source.getKeywords().split(";"))
    output.setCreationDate(source.getCreationDate())
    output.setModificationDate(source.getModificationDate())
    output.setCreator(source.getCreator())
}

/* This function waits for user input, then returns the result */
function editPrompt(query) {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout,
    });

    return new Promise(resolve => rl.question(query, ans => {
        rl.close();
        resolve(ans);
    }))
}

// [MAIN] Start of the program. Calls openFile, catches error
openFile(process.argv[2], editMetadata).catch(err => console.log(err))