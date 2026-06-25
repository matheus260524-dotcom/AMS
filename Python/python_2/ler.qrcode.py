from PIL import Image
from pyzbar.pyzbar import decode

imagem = Image.open(r"C:\Users\DELL\Downloads\python_2\qrcode.png")

resultado = decode(imagem)

for qr in resultado:
    print(qr.data.decode("utf-8"))