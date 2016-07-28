function toggle_all(source) {
  checkboxes = document.getElementsByClassName("studentcheck");
  for(var i=0, n=checkboxes.length;i<n;i++) {
    checkboxes[i].checked = source.checked;
  }
}