# ☕ cafe-ord

A blockchain-based platform for coffee bag traceability that leverages ICP for decentralized record management and Stacks to generate Bitcoin ordinals. The system tracks organic coffee production from cultivation to the export of green coffee, ensuring authenticity and transparency through verified certifications on the blockchain.

## 🛠️ Architecture Overview

The platform is designed using a microservices architecture with distinct canisters to handle different aspects of the system. Below is a high-level view of how the components interact:

![Cafe-ord Architecture](https://cdn.discordapp.com/attachments/1295209682494816296/1301544929452883968/image.png?ex=6724ddac&is=67238c2c&hm=ea46cc1da09889c2b8f70e490175f1a676d48d57b5863b8afcfb1ef9afdfde6f&)

### System Components:

1. **Producer (Person)**: The coffee producer, who inputs data about coffee cultivation and production.
2. **Frontend (Canister)**: A user interface where producers and cooperatives can enter traceability data.
3. **Backend (Canister)**: Manages business logic and stores traceability data. It also communicates with Stacks to generate Bitcoin ordinals for each batch of coffee.
4. **CafeOrd Stacks (Container)**: Integrates with Stacks to create unique ordinals for every coffee lot.
5. **QR Code Generator (Canister)**: Creates unique QR codes that point to traceability data stored on ICP.
6. **Cooperative (Person)**: Validates and adds additional traceability data related to quality, certifications, and logistics.
7. **Final Consumer (Person)**: Scans the QR code to access the traceability information and verify the authenticity of the coffee they purchase.

## 🌱 Traceability Phases

1. **Cultivation**: 🌾 Records the origin, farm, and cultivation methods.
2. **Harvesting**: 🍇 Tracks the harvest date, method, and lot identification.
3. **Processing**: 🔄 Captures drying, treatment, and quality control details.
4. **Packaging**: 📦 Logs packaging type, date, and storage conditions.
5. **Certification**: ✅ Verifies compliance with organic and fair trade standards.
6. **Export**: 🚢 Registers export details, including shipment and destination information.

## 🚀 How to Start the Project

### Key Commands

```bash
cd cafe-ord/
dfx help
dfx canister --help
```

### Run the Project Locally

1. Start the replica:
   ```bash
   dfx start --background --clean
   ```
2. Deploy your canisters:
   ```bash
   dfx deploy
   ```

Once deployed, access your application at:  
`http://localhost:4943?canisterId={asset_canister_id}`

### Generate a New Candid Interface

```bash
npm run generate
```

### Start Frontend Development Server

```bash
npm start
```

Your frontend will be available at:  
`http://localhost:8080`, proxying API requests to the replica on port 4943.

### Frontend Environment Variables

- Set `DFX_NETWORK` to `ic` if using Webpack.
- In `dfx.json`, configure `canisters -> {asset_canister_id} -> declarations -> env_override` to replace `process.env.DFX_NETWORK` in the generated declarations.
