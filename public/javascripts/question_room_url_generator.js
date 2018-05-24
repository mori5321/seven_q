class QuestionRoomUrlGenerator {
  constructor(target, questionGroupId, button) {
    this.target = target;
    this.questionGroupId = questionGroupId
    this.button = button;
  }

  setEventListeners() {
    this.button.addEventListener('click', this.generate.bind(this))
  }

  generate() {
    let _this = this
    axios.post(
      `/question_groups/${this.questionGroupId}/question_rooms`,
      {}
    ).then((res) => {
      console.log(res)
      _this.target.innerHTML = `<h6>${res.data.url}</h6>`
      document.getElementById('copyButton').classList.remove('disabled')
      return res
    }).catch((err) => {
      console.log(err)
      return err
    })
  }
}

