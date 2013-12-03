public with sharing class AccountsController {
	
	@RemoteAction static public List<Account> createAccounts(List<Account> accounts) {
		insert accounts;
		return accounts;
	}
	
	@RemoteAction static public List<Account> readAccounts(Id parentId) {
		return [SELECT Id, Name FROM Account WHERE ParentId = :parentId];
	}
	
	@RemoteAction static public List<Account> updateAccounts(List<Account> accounts) {
		update accounts;
		return accounts;
	}
	
	@RemoteAction static public void destroyAccounts(List<Account> accounts) {
		delete accounts;
	}
	
}