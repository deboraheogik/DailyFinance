const { notarize } = require('electron-notarize');

exports.default = async function notarizeMacos(context) {
  const { electronPlatformName, appOutDir } = context;
  if (electronPlatformName !== 'darwin') {
    return;
  }
  //return;
  /*if (process.env.CI !== "true") {
    console.warn('Skipping notarizing step. Packaging is not running in CI');
    return;
  }*/

  /*if (!('APPLE_ID' in process.env && 'APPLE_ID_PASS' in process.env)) {
    console.warn('Skipping notarizing step. APPLE_ID and APPLE_ID_PASS env variables must be set');
    return;
  }*/

  const appName = context.packager.appInfo.productFilename;
  console.log ("Notarizing");
  console.log ("com.dailyfinance.app");
  await notarize({
    appBundleId: "com.dailyfinance.app",
    appPath: `${appOutDir}/${appName}.app`,
    appleId: "kunampdnno3@hotmail.com",
    appleIdPassword: "aknm-huid-savt-qzme",
  });
  console.log("Notarizing completed!");
};
