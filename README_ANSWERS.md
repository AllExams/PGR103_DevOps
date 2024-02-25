Oppgave 1

a) .github/workflows/main.yml kompilerer koden og lager et container image ved hjelp av dockerfile hver gang de pushes til en hvilket som helst branch.

b) Slik beskytter man f.eks main branch i situasjoner hvor utviklere bruker pull-request:
1. Gå inn på "settings" når du er i det aktuelle repositoriet
2. Trykk på "Branches" under "Code and automation"
3. Trykk på "add branch protection rule"
4. Velg navn på branch du ønsker å beskytte (i dette tilfelle "main")
5. Huk av boks med tittel "Require status check to pass before merging"
6. Skriv inn navn på aktiv github actions workflow (Den som kompilerer koden) for å bruke den når man pusher til main.
7. Trykk "create"

c) I en situasjon hvor man har en arbeidsflyt der minst 2 personer i teamet på godkjenne edringer mot main branch:
- Ulemper:
  - Tid: Dette vil gjøre at endringer mot "main branch" vil ta lenger tid å implementere hver gang man øsnker å få igjennom en pull-request fordi flere utviklere må sette seg inn i endringene. 
Dette kan også være dyrere for bedrifter siden de må velge å sette av dobbel så mange ressurser. Handlingen kan også koste fordi det vil ta lengere tid å lansere oppdateringer ut i produksjon.
  
- Fordeler:
  - Økt kvalitet: Ved å øke antall utviklere vil man øke sannsynligheten for å oppdage feil eller forbedringer.
Dette vil kunne skape økt produksjonskode å skape en bedre tjeneste.
  - Økt samarbeid: Selve prosessen vil kreve at utviklere samarbeider for å bli enige om hva som f.eks er "best practise". 
Dette kan fremme kommunikasjon og samarbeid mellom utviklere.

Oppgave 2

a) Var usikker på om nbx skulle være i variabelen repository_name eller om det var ønsket å skrive det inn gjennom terminalen siden det ble nevnt at det ikke skulle hardkodes. 

b) For at sensor skal kjøre terraform koden må følgene steg gjøres (Antat at terraform er lastet ned):
1. Bruk terminalen og naviger deg til folderet "infra"
2. Skriv "terraform init"
3. Skriv "terraform plan" Her må du fylle inn ditt egen docker passord og brukernavn. i tillegg til repository navn (nbx)
4. Skriv "terraform apply" Fyll inn lik information som i steg 3. etterfølgt av å skrive "yes" på fjerde spørsmål
5. Om brukernavn og passord stemmer skal et repo være lastet opp på sernsor sin dockerhub konto.

c) Selv om man sletter "Terraform.tfstate" vil selve Docker hub repositoriet fortsatt eksistere.
Dette gjør det ikke mulig å lage et nytt et med samme navn før det er slettet på dockerhub.


Oppgave 3

Steg sensor må gjøre for å kjøre den oppdaterte GitHub Actions workflowen på sin egen PC etter å ha forket repo'et.
1. Aller først på sensor legge til secrets som "dockerhub brukernavn" og "dockerhub token".
2. dockerhub token finnes på egen dockerhub bruker ved å gå til "My account" -> "Security" -> "new access token". 
3. Gå til det gjeldene repositoriet og trykk på "Settings" -> "Secret and variables" og velg Actions.
4. Trykk så på "New repository sercret". Her skal du legge til brukernavnet på din dockerhub bruker under navn "DOCKERHUB_USERNAME" og dockerhub token fra steg 2 under navn "DOCKERHUB_TOKEN".
5. Nå skal det være synlig under fanen "Repository secrets".
6. Ved kjøring av neste workflow mot main vil main.yml pushe docker image til dockerhub kontoen til sensor

Om sensor ønsker å gjøre et av mine container images på min dockerhub på han/hun skrive:
- docker run <image_navn> 
- Så om f.eks jeg har et som heter "<Mitt_bruker_navn>/hello-world" kan sensor kjøre "docker run <Mitt_bruker_navn>/hello-world".