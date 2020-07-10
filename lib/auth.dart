class StudentUserDetailsGoogle
{
  final String providerDetails;
  final String userName;
  final String photoURL;
  final String userEmail;
  final String userRoll;
  final String userSvv;
  final String batch;
  final String sem;
  final String gender;
  final List<ProviderDetails> providerData;

  StudentUserDetailsGoogle(this.providerDetails, this.userName, this.photoURL, this.userEmail, this.providerData, this.userRoll, this.userSvv, this.batch, this.sem, this.gender);

}
class ProviderDetails
{
  final String providerDetails;

  ProviderDetails(this.providerDetails);

}
class StudentUserDetails
{
  final String userName;
  final String photoURL;
  final String userEmail;
  final String userRoll;
  final String userSvv;
  final String batch;
  final String sem;
  final String gender;
  StudentUserDetails(this.userName, this.photoURL, this.userEmail, this.userRoll, this.userSvv, this.batch, this.sem, this.gender);

}