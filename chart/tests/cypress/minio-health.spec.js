describe('Basic Minio', function() {
  it('Check Minio UI is accessible', function() {
      cy.visit(Cypress.env('url'))
  })
})
