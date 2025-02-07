// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "controllers"
// Add this JavaScript to your application.js
document.addEventListener('DOMContentLoaded', () => {
  const popup = document.getElementById('importPopup');
  const openPopup = document.getElementById('open-popup');
  const closePopup = document.getElementsByClassName('close')[0];

  openPopup.onclick = function(event) {
    event.preventDefault();  // Prevent the default link behavior
    popup.style.display = 'block';
  }

  closePopup.onclick = function() {
    popup.style.display = 'none';
  }

  window.onclick = function(event) {
    if (event.target == popup) {
      popup.style.display = 'none';
    }
  }

  const importData = () => {
    const fileInput = document.getElementById('jsonFileInput');
    const file = fileInput.files[0];
    const departmentName = document.getElementById('departmentNameInput').value;
    const importType = document.getElementById('importType').value;
    
    if (!file) {
      alert('Please select a file');
      return;
    }
    if (!departmentName) {
      alert('Please enter a department name');
      return;
    }

    const reader = new FileReader();
    reader.onload = (event) => {
      try {
        const parsedData = JSON.parse(event.target.result);
        const form = document.getElementById('importForm');
        form.action = importType === 'classes' ? 
          '/home/import_data_classes' : 
          '/home/import_data_members';
        
        document.getElementById('importedData').value = JSON.stringify(parsedData);
        document.getElementById('departmentName').value = departmentName;
        form.submit();
      } catch (error) {
        alert('Invalid JSON format');
        console.error('JSON parsing error:', error);
      }
    };
    reader.readAsText(file);
  };
  window.importData = importData;

  // Add questions form functionality
  const addQuestionButton = document.getElementById('add-question');
  if (addQuestionButton) {
    let questionCount = 0;
    
    // Show/hide delete buttons based on question count
    const updateDeleteButtons = () => {
      const deleteButtons = document.querySelectorAll('.delete-question');
      deleteButtons.forEach(button => {
        button.style.display = deleteButtons.length > 1 ? 'block' : 'none';
      });
    };

    // Handle delete question
    document.addEventListener('click', function(e) {
      if (e.target && e.target.classList.contains('delete-question')) {
        e.target.closest('.question-fields').remove();
        updateDeleteButtons();
      }
    });
    
    addQuestionButton.addEventListener('click', function() {
      questionCount++;
      const questionsContainer = document.getElementById('questions-container');
      const newQuestionFields = questionsContainer.querySelector('.question-fields').cloneNode(true);
      
      newQuestionFields.querySelectorAll('textarea').forEach(input => {
        input.value = '';
        const fieldName = input.name.includes('enunciado') ? 'enunciado' : 'texto';
        input.name = `questaos[${questionCount}][${fieldName}]`;
      });
      
      questionsContainer.appendChild(newQuestionFields);
      updateDeleteButtons();
    });
  }
});