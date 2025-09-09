import { Unity } from 'unity';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    Unity.echo({ value: inputValue })
}
