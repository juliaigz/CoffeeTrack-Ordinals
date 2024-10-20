# ☕ cafe-ord

A blockchain-based platform for coffee bag traceability that leverages ICP for decentralized record management and Stacks to generate Bitcoin ordinals. The system tracks organic coffee production from cultivation to the export of green coffee, ensuring authenticity and transparency through verified certifications on the blockchain.

## 🌱 Traceability Phases

1. **Cultivation**: 🌾 Records the origin, farm, and cultivation methods.
2. **Harvesting**: 🍇 Tracks the harvest date, method, and lot identification.
3. **Processing**: 🔄 Captures drying, treatment, and quality control details.
4. **Packaging**: 📦 Logs packaging type, date, and storage conditions.
5. **Certification**: ✅ Verifies compliance with organic and fair trade standards.
6. **Export**: 🚢 Registers export details, including shipment and destination information.

## How to Start the Project

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
