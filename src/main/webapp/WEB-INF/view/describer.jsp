<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AI Image Describer</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        .loader {
            border: 4px solid #ddd;
            border-top: 4px solid #2563eb;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            animation: spin 0.7s linear infinite;
            margin: auto;
        }
        @keyframes spin { 100% { transform: rotate(360deg); } }
    </style>
</head>

<body class="bg-gray-100">

<div class="max-w-4xl mx-auto py-10">

    <h1 class="text-4xl text-center font-bold text-blue-600 mb-10">
        AI Image Describer
    </h1>

    <div class="bg-white shadow-lg rounded-xl p-8">

        <h2 class="text-xl mb-2 font-semibold">Upload Image File</h2>

        <input type="file" id="fileInput" 
               class="border p-2 rounded-lg w-full mb-4" />

        <button onclick="summarizeFile()"
                class="bg-blue-600 text-white px-5 py-2 rounded-lg hover:bg-blue-700">
            Summarize File
        </button>

        
        <div id="loader" class="hidden mt-6">
            <div class="loader"></div>
            <p class="text-center text-gray-500 mt-2">Summarizing...</p>
        </div>

        <h2 class="text-xl font-semibold mt-8">Summary</h2>

        <div id="output"
             class="bg-gray-50 border p-4 rounded-lg mt-2 whitespace-pre-wrap text-gray-700">
            Your summary will appear here...
        </div>
    </div>

</div>

<script>
async function summarizeFile() {
    const file = document.getElementById("fileInput").files[0];
    if (!file) return alert("Please upload file");

    const formData = new FormData();
    formData.append("file", file);

    showLoader(true);

    const res = await fetch("/api/describe/file", { method: "POST", body: formData });
    const text = await res.text();

    showLoader(false);
    document.getElementById("output").textContent = text;
}


function showLoader(show) {
    document.getElementById("loader").classList.toggle("hidden", !show);
}
</script>

</body>
</html>