window.onload = function () {
  const linkHeader = document.querySelector('[data-link="Link"]');

  if (linkHeader) {
    const linkText = linkHeader.innerText;
    const linkElement = document.createElement("a");
    linkElement.href = linkText;
    linkElement.innerText = "Click Here"; // Customize the link text as needed

    linkHeader.innerText = "";
    linkHeader.appendChild(linkElement);
  }
};
