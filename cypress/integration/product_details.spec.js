describe("testing", () => {
  it("Navigates to homepage", () => {
    cy.visit("/");
  });


  it("Navigate to product page", () => {
    cy.get('article').first().click();
    cy.url().should('include', '/products/2');
  });
  
});
