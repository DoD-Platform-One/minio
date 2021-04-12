describe('Minio Login', function() {
  it('Check Minio Login', function() {
      cy.visit(Cypress.env('url')+"/minio/login")
      // Fill the username
        cy.get('[name="username"]')
        .type(Cypress.env('accesskey'))
        .should('have.value', Cypress.env('accesskey'));

      // Fill the password
      cy.get('[name="password"]')
        .type(Cypress.env('secretkey'))
        .should('have.value', Cypress.env('secretkey'));

      // Locate and submit the form
      cy.get('form').submit();
      
      // Verify the app redirected you to the homepage
      cy.location('pathname', { timeout: 10000 }).should('eq', '/minio/');
      
      // Verify the page title is "Home"
      cy.title().should('eq', 'MinIO Browser');
    
  })
})
