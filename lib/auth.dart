class UserDetails
{
  final String providerDetails;
  final String userName;
  final String photoURL;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails, this.userName, this.photoURL, this.userEmail, this.providerData);

}
class ProviderDetails
{
  final String providerDetails;

  ProviderDetails(this.providerDetails);

}