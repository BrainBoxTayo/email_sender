class Email {
  String? senderId;
  String? subject;

  String? body;
  String? status;
  String? emailGroup;
  DateTime? createdAt;
  String? attachments;

  Email({
    this.senderId,
    this.subject,
    this.body,
    this.createdAt,
    this.emailGroup,
    this.attachments,
    this.status,
  });
}
