{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "foxglove_sdk_vendor";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."foxglove_sdk_vendor";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "foxglove_sdk_vendor" = substituteSource {
      src = fetchgit {
        name = "foxglove_sdk_vendor-source";
        url = "https://github.com/jlack1987/foxglove_sdk_vendor-release.git";
        rev = "505195001a68cc6fc400555fb70b6860d72d3692";
        hash = "sha256-oHsjMXTM1L6L/aF7ZI73U7Ek2ViuhjeQWDVkfEKyAoM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD \"\${FOXGLOVE_SDK_URL}\"";
          to = "DOWNLOAD file://${sources."foxglove_sdk_vendor/foxglove-v0"}";
        }
      ];
    };
    "foxglove_sdk_vendor/foxglove-v0" = substituteSource {
      src = fetchurl {
        name = "foxglove-v0-source";
        url = "https://github.com/foxglove/foxglove-sdk/releases/download/sdk/v0.15.1/foxglove-v0.15.1-cpp-aarch64-unknown-linux-gnu.zip";
        hash = "sha256-bOcSnXtVGiJIO/inWbLy2l5ZNXMnyT0czADPuL6IaCI=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package that fetches prebuilt Foxglove SDK archives and exposes the headers\n    and libfoxglove.a static library to ROS 2 workspaces.\n  ";
  };
})
