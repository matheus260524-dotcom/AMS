
const bola = document.querySelector(".bola");
const racket = document.querySelector(".racket");
const racket1 = document.querySelector(".racket1");

let x = 350;
let y = 250;

let velocidadeX = 5;
let velocidadeY = 4;

let jogador1Y = 100;
let jogador2Y = 100;

const velocidadeRaquete = 10;

// Posicionamento inicial
function iniciar() {
    bola.style.left = x + "px";
    bola.style.top = y + "px";

    racket.style.top = jogador1Y + "px";
    racket1.style.top = jogador2Y + "px";
}

iniciar();

// Movimentação das raquetes
document.addEventListener("keydown", (evento) => {

    // Jogador 1
    if (evento.key === "ArrowUp") {
        jogador1Y -= velocidadeRaquete;
    }

    if (evento.key === "ArrowDown") {
        jogador1Y += velocidadeRaquete;
    }

    // Jogador 2
    if (evento.key === "w" || evento.key === "W") {
        jogador2Y -= velocidadeRaquete;
    }

    if (evento.key === "s" || evento.key === "S") {
        jogador2Y += velocidadeRaquete;
    }

    // Limites da tela
    jogador1Y = Math.max(0, Math.min(
        window.innerHeight - racket.offsetHeight,
        jogador1Y
    ));

    jogador2Y = Math.max(0, Math.min(
        window.innerHeight - racket1.offsetHeight,
        jogador2Y
    ));

    racket.style.top = jogador1Y + "px";
    racket1.style.top = jogador2Y + "px";
});

// Função de colisão
function colisao(objeto1, objeto2) {

    const a = objeto1.getBoundingClientRect();
    const b = objeto2.getBoundingClientRect();

    return (
        a.left < b.right &&
        a.right > b.left &&
        a.top < b.bottom &&
        a.bottom > b.top
    );
}

// Movimento da bola
function movimentarBola() {

    x += velocidadeX;
    y += velocidadeY;

    bola.style.left = x + "px";
    bola.style.top = y + "px";

    // Colisão com paredes
    if (y <= 0) {
        y = 0;
        velocidadeY *= -1;
    }

    if (y + bola.offsetHeight >= window.innerHeight) {
        y = window.innerHeight - bola.offsetHeight;
        velocidadeY *= -1;
    }

    // Colisão com jogador 1
    if (velocidadeX < 0 && colisao(bola, racket)) {

        x = racket.offsetLeft + racket.offsetWidth;
        velocidadeX *= -1;
    }

    // Colisão com jogador 2
    if (velocidadeX > 0 && colisao(bola, racket1)) {

        x = racket1.offsetLeft - bola.offsetWidth;
        velocidadeX *= -1;
    }

    // Saiu pela esquerda ou direita
    if (x < -bola.offsetWidth || x > window.innerWidth) {

        x = window.innerWidth / 2;
        y = window.innerHeight / 2;

        velocidadeX *= -1;
        velocidadeY = 4;
    }

    bola.style.left = x + "px";
    bola.style.top = y + "px";

    requestAnimationFrame(movimentarBola);
}

movimentarBola();
