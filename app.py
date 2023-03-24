from flask import Flask, request
import subprocess
import os

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, World!'

@app.route('/patch', methods=['POST'])
def patch_boot_image():
    if 'boot_image' not in request.files:
        return 'No boot_image file provided', 400

    boot_image = request.files['boot_image']
    boot_image.save('boot.img')

    magisk_path = '/app/magisk/Magisk-v25.2.apk'  # Update this path to the actual location of the Magisk binary inside the extracted APK
    output_image = 'patched_boot.img'

    try:
        result = subprocess.run([magisk_path, 'boot.img', output_image], check=True)
        return f'Successfully patched boot image: {output_image}', 200
    except subprocess.CalledProcessError as e:
        return f'Error patching boot image: {e}', 500
    finally:
        os.remove('boot.img')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)

