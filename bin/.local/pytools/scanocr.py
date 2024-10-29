import pytesseract
from typing import Literal
from pdf2image import convert_from_path
import argparse

def ocr_pdf_to_text(pdf_path:str, lang:Literal['deu', 'eng']):
    images = convert_from_path(pdf_path)
    for i in range(len(images)):
        print(f"Page {i + 1}\n{'-' * 80}\n")
        text = pytesseract.image_to_string(images[i], lang=lang)
        print(text)


def main():
    parser = argparse.ArgumentParser(description="Extracts text from scanned document (PDF containing images) using OCR\n ensure ")
    parser.add_argument("pdf_path", help="Path to the scanned PDF file containing images.")
    parser.add_argument(
        "-l", "--language", help="Language for OCR ('en' for English, 'de' for German). Default is 'de'.", default='de'
    )

    args = parser.parse_args()

    ocr_pdf_to_text(args.pdf_path,  lang= 'eng' if args.language == 'en' else 'deu')
    

if __name__ == "__main__":
    main()

