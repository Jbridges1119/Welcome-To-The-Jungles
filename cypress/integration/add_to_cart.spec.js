describe("testing", () => {
  it("Navigates to homepage", () => {
    cy.visit("/");
  });

  it("Click Add to cart", () => {
    cy.get('.btn').first().click({ force: true });
    cy.get(".end-0").should('contain', '1');
  });
  
});
