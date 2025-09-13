---
layout: post
title:  "Welcome to Jekyll!"
date:   2022-11-11 16:27:06 -0600
categories: jekyll update
---

In this page we have some examples of the [https://github.com/mannyray/jekyll-expand](https://github.com/mannyray/jekyll-expand) tag plugin. Start with the one below... press the "Show more" followed by the "Show less" button to see the style and transitions of the buttons.


{% expand %}

Here is some text followed by other markdown features like a photo. Sometimes you only want to show the content to the user that chooses to see it while keeping the overall content of the page slim.

![](/photos/pexels-pixabay-326235.jpg)

{% endexpand %}

This plugin is also really good for long pieces of code - you want your user to be able to copy paste and use the code, but not take away from the concise way you present your content:


{% expand %}

```python
import face_recognition
import os
import uuid
from PIL import Image

# --- Configuration ---
# Folder with original images
input_folder = 'input_images'
# Where to save cropped faces      
faces_folder = 'extracted_faces'
# Where to save embeddings (as .npy files) 
embeddings_folder = 'embeddings'   

# Create output folders if they don't exist
os.makedirs(faces_folder, exist_ok=True)
os.makedirs(embeddings_folder, exist_ok=True)

# Loop through all files in the input folder
for filename in os.listdir(input_folder):
    if not filename.lower()
        .endswith(('.png', '.jpg', '.jpeg')):
        continue  # Skip non-image files

    image_path = os.path.join(input_folder, filename)
    image = face_recognition.load_image_file(image_path)

    # Find face locations
    face_locations = face_recognition
        .face_locations(image)

    # Compute embeddings for each face
    face_encodings = face_recognition
        .face_encodings(image, face_locations)

    
    for i, (location, encoding) in 
        enumerate(zip(face_locations, face_encodings)):
        top, right, bottom, left = location

        # Crop the face from the original image
        face_image = Image.
            fromarray(image[top:bottom, left:right])
        face_filename = f"{uuid.uuid4()}.jpg"
        face_path = os.path
            .join(faces_folder, face_filename)
        face_image.save(face_path)

        # Save the face embedding as a .npy file
        embedding_filename = face_filename
            .replace('.jpg', '.npy')
        embedding_path = os.path
            .join(embeddings_folder, embedding_filename)

        # Save as numpy array
        import numpy as np
        np.save(embedding_path, encoding)

        print(f"Saved face and embedding:
            {face_filename}")

print("✅ Done extracting and computing embeddings.")
```

{% endexpand %}

You can also change the preview height to show more/less content. This section below is identical to the one above it, but just has a smaller preview.

{% expand preview_height:"50"%}

```python
import face_recognition
import os
import uuid
from PIL import Image

# --- Configuration ---
# Folder with original images
input_folder = 'input_images'
# Where to save cropped faces      
faces_folder = 'extracted_faces'
# Where to save embeddings (as .npy files) 
embeddings_folder = 'embeddings'   

# Create output folders if they don't exist
os.makedirs(faces_folder, exist_ok=True)
os.makedirs(embeddings_folder, exist_ok=True)

# Loop through all files in the input folder
for filename in os.listdir(input_folder):
    if not filename.lower()
        .endswith(('.png', '.jpg', '.jpeg')):
        continue  # Skip non-image files

    image_path = os.path.join(input_folder, filename)
    image = face_recognition.load_image_file(image_path)

    # Find face locations
    face_locations = face_recognition
        .face_locations(image)

    # Compute embeddings for each face
    face_encodings = face_recognition
        .face_encodings(image, face_locations)

    
    for i, (location, encoding) in 
        enumerate(zip(face_locations, face_encodings)):
        top, right, bottom, left = location

        # Crop the face from the original image
        face_image = Image.
            fromarray(image[top:bottom, left:right])
        face_filename = f"{uuid.uuid4()}.jpg"
        face_path = os.path
            .join(faces_folder, face_filename)
        face_image.save(face_path)

        # Save the face embedding as a .npy file
        embedding_filename = face_filename
            .replace('.jpg', '.npy')
        embedding_path = os.path
            .join(embeddings_folder, embedding_filename)

        # Save as numpy array
        import numpy as np
        np.save(embedding_path, encoding)

        print(f"Saved face and embedding:
            {face_filename}")

print("✅ Done extracting and computing embeddings.")
```

{% endexpand %}


Finally, you can also modify the button text such as below:

{% expand button_text:"Click me you lazy bum!"%}

```python
import face_recognition
import os
import uuid
from PIL import Image

# --- Configuration ---
# Folder with original images
input_folder = 'input_images'
# Where to save cropped faces      
faces_folder = 'extracted_faces'
# Where to save embeddings (as .npy files) 
embeddings_folder = 'embeddings'   

# Create output folders if they don't exist
os.makedirs(faces_folder, exist_ok=True)
os.makedirs(embeddings_folder, exist_ok=True)

# Loop through all files in the input folder
for filename in os.listdir(input_folder):
    if not filename.lower()
        .endswith(('.png', '.jpg', '.jpeg')):
        continue  # Skip non-image files

    image_path = os.path.join(input_folder, filename)
    image = face_recognition.load_image_file(image_path)

    # Find face locations
    face_locations = face_recognition
        .face_locations(image)

    # Compute embeddings for each face
    face_encodings = face_recognition
        .face_encodings(image, face_locations)

    
    for i, (location, encoding) in 
        enumerate(zip(face_locations, face_encodings)):
        top, right, bottom, left = location

        # Crop the face from the original image
        face_image = Image.
            fromarray(image[top:bottom, left:right])
        face_filename = f"{uuid.uuid4()}.jpg"
        face_path = os.path
            .join(faces_folder, face_filename)
        face_image.save(face_path)

        # Save the face embedding as a .npy file
        embedding_filename = face_filename
            .replace('.jpg', '.npy')
        embedding_path = os.path
            .join(embeddings_folder, embedding_filename)

        # Save as numpy array
        import numpy as np
        np.save(embedding_path, encoding)

        print(f"Saved face and embedding:
            {face_filename}")

print("✅ Done extracting and computing embeddings.")
```

{% endexpand %}
