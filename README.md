<h2>Flask-based Boot Image Patching Tool</h2>
<p>This project is a Flask-based boot image patching tool that allows users to upload a boot image file and patch it
  with the latest version of Magisk. The patched boot image file can then be used to root Android devices.</p>
<p>The tool has two endpoints:</p>
<ul>
  <li>
    <p><code>/</code> : A basic endpoint that returns "Hello, World!" to verify that the server is up and running.</p>
  </li>
  <li>
    <p><code>/patch</code>: A POST endpoint that accepts a boot image file in the request and patches it with Magisk.
    </p>
  </li>
</ul>
<h3>How it Works</h3>
<p>The tool downloads the Magisk APK and extracts the Magisk binary from it. When a boot image file is uploaded to the
  <code>/patch</code> endpoint, the tool saves the file as <code>boot.img</code>. It then uses the Magisk binary to
  patch the <code>boot.img</code> file and save the output as <code>patched_boot.img</code>. The <code>boot.img</code>
  file is deleted after the patching is complete. The user can then download the patched boot image file and use it to
  root their Android device.</p>
<h3>Requirements</h3>
<p>The tool requires Python 3.9 and the following dependencies:</p>
<ul>
  <li>Flask</li>
  <li>apktool</li>
</ul>
<p>It also requires the following tools to be installed:</p>
<ul>
  <li>wget</li>
  <li>unzip</li>
  <li>openjdk-11-jdk-headless</li>
</ul>
<h3>Usage</h3>
<p>To use the tool, follow these steps:</p>
<ol>
  <li>Clone the repository</li>
  <li>Install the required tools and dependencies</li>
  <li>Run the Flask application using <code>python app.py</code></li>
  <li>Access the tool via a web browser at <code>http://localhost:80</code></li>
  <li>Upload a boot image file to the <code>/patch</code> endpoint</li>
  <li>Download the patched boot image file from the response</li>
</ol>
<h3>Docker Image</h3>
<p>The project includes a Dockerfile that can be used to build a Docker image of the tool. The Docker image includes
  all the required dependencies and tools.</p>
<p>To build the Docker image, run the following command from the root of the project:</p>
<pre><div class="bg-black rounded-md mb-4"><div class="flex items-center relative text-gray-200 bg-gray-800 px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>arduino</span><button class="flex ml-auto gap-2"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="h-4 w-4" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>Copy code</button></div><div class="p-4 overflow-y-auto"><code class="!whitespace-pre hljs language-arduino">docker build -t boot-image-patcher .
</code></div></div></pre>
<p>To run the Docker container, use the following command:</p>
<pre><div class="bg-black rounded-md mb-4"><div class="flex items-center relative text-gray-200 bg-gray-800 px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>arduino</span><button class="flex ml-auto gap-2"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="h-4 w-4" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>Copy code</button></div><div class="p-4 overflow-y-auto"><code class="!whitespace-pre hljs language-arduino">docker run -p <span class="hljs-number">80</span>:<span class="hljs-number">80</span> boot-image-patcher
</code></div></div></pre>
<h3>License</h3>
<p>This project is licensed under the MIT License. See the <code>LICENSE</code> file for details.</p>

