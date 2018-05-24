class Modal {
  constructor(modal, overlay, buttons = {}) {
    this.modal = modal;
    this.overlay = overlay;
    this.openButton = buttons.openButton;
    this.closeButton = buttons.closeButton;
  }

  setEventListeners() {
    this.closeButton.addEventListener('click', this.close.bind(this))
    this.overlay.addEventListener('click', this.close.bind(this))
    this.openButton.addEventListener('click', this.open.bind(this))
  }

  open() {
    this.overlay.classList.remove('hidden');
    this.modal.classList.remove('hidden');
  }

  close() {
    console.log('closing')
    this.overlay.classList.add('hidden');
    this.modal.classList.add('hidden');
  }
}