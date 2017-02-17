window.onload = function() {
	document.getElementById("generator-solver-checkbox").addEventListener("click", toggleTopicAndProblem);

	function toggleTopicAndProblem() {
		var topicDiv = document.getElementById("topic");
		var problemDiv = document.getElementById("problem");
		var checkbox = document.getElementById("generator-solver-checkbox");
		if (checkbox.checked) {
			topicDiv.style.display = 'none';
			problemDiv.style.display = 'inline-block';
		} else {
			topicDiv.style.display = 'inline-block';
			problemDiv.style.display = 'none';
		}
		console.log("hey");
	};

	toggleTopicAndProblem();
	console.log("hello");
};

