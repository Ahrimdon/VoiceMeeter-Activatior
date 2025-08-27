# VoiceMeeter Potato Activation Script

![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/EthanSpleefan/VoiceMeeter-Activatior/total)


This batch script modifies a registry key to activate the free version of Voicemeeter Potato without the donationware popup because nobody deserves to wait 300+ seconds to hear :P. If you enjoy voicemeeter or make money from the use of it consider paying for it [here!](https://vb-audio.com/Voicemeeter/potato.htm)

If you found this helpful consider leaving a star!

## Version Compatibility

**Tested and confirmed working on:**
- VoiceMeeter Potato v3.0.2.8 and earlier versions

**Known Issues:**
- May not work on VoiceMeeter Potato v3.1.0.0 and later due to changes in the activation mechanism
- Different VoiceMeeter variants may require different registry keys

## Usage

1. Download the script.
2. Run the script as an administrator.
3. Follow any on-screen instructions.

## Troubleshooting

**If the script doesn't work:**

1. **Check your VoiceMeeter version**: Right-click on VoiceMeeter and select "About" to see your version number
2. **Try different registry paths**: Newer versions might use different registry locations
3. **Check if VoiceMeeter is running**: Close VoiceMeeter completely before running the script
4. **Run as Administrator**: The script requires administrative privileges to modify the registry

**For different VoiceMeeter variants:**
- **VoiceMeeter Basic**: May use `HKEY_CURRENT_USER\VB-Audio\VoiceMeeter` 
- **VoiceMeeter Banana**: May use `HKEY_CURRENT_USER\VB-Audio\VoiceMeeter` or `HKEY_CURRENT_USER\VB-Audio\VoiceMeeterBanana`
- **VoiceMeeter Potato**: Uses `HKEY_CURRENT_USER\VB-Audio\VoiceMeeter` (this script)

**Alternative registry locations to try if the script fails:**
- `HKEY_LOCAL_MACHINE\SOFTWARE\VB-Audio\VoiceMeeter`
- `HKEY_CURRENT_USER\SOFTWARE\VB-Audio\VoiceMeeter`
- `HKEY_CURRENT_USER\VB-Audio\VoiceMeeterPotato`

## Important Notes

- This script is intended for personal use only. If you use Voicemeeter for work or make money from it then consider paying what you can on the voicemeeter site.
- Ensure you have a backup of your registry before running the script.
- Use at your own risk.
- **Close VoiceMeeter completely before running the script and restart it after activation**
- The script now includes multiple registry paths and better error handling for newer versions

## FAQ

**Q: The script says "SUCCESS" but VoiceMeeter still shows the donation popup. What do I do?**
A: Try the following:
1. Make sure VoiceMeeter is completely closed (check Task Manager)
2. Run the script as Administrator
3. Try option 3 in the script (alternative registry paths)
4. Restart your computer after running the script

**Q: What VoiceMeeter version was this tested on?**
A: This script was originally designed for VoiceMeeter Potato v3.0.2.8 and earlier. VB-Audio may have changed the activation mechanism in newer versions (v3.1.0.0+).

**Q: Does this work with VoiceMeeter Basic or Banana?**
A: The script is designed for VoiceMeeter Potato, but the enhanced version includes options to try alternative registry paths that may work with other variants.

## Disclaimer

This script is provided as-is, without any guarantees. I am not responsible for any issues that may arise from the use of this script however as of the initial commit date it works and activates the program without error. But remember that downloading programs/scripts off the internet can be dangerous, please feel free to check the source code of this project!
