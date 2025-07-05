class QuizQuestion {
  // Constructor untuk inisialisasi text dan list jawaban
  const QuizQuestion(this.text, this.answers);

  // Pertanyaan kuis
  final String text;

  // Daftar jawaban
  final List<String> answers;

  // Method untuk mengembalikan jawaban dalam urutan acak
  List<String> getShuffledAnswer() {
    // Salin list agar tidak mengubah list asli
    final List<String> shuffledList = List.of(answers);
    
    // Acak urutan list
    shuffledList.shuffle();
    
    return shuffledList;
  }
}
