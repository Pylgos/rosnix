{
  ament-cmake,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  data-tamer-cpp,
  data-tamer-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap-vendor,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "data_tamer_tools";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."data_tamer_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ data-tamer-cpp data-tamer-msgs mcap-vendor rcl-interfaces rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" "protobuf-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ data-tamer-cpp data-tamer-msgs mcap-vendor rcl-interfaces rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" "protobuf-dev" ]; };
  checkInputs = [ ament-index-cpp ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "data_tamer_tools" = substituteSource {
      src = fetchgit {
        name = "data_tamer_tools-source";
        url = "https://github.com/jlack1987/data_tamer_tools-release.git";
        rev = "82ade880b749803fd927beed53ffbf366268d6ff";
        hash = "sha256-EvCerq3yfkgu0JByBdz1txnojCppMKDJbdZDUXS8jHY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/foxglove/foxglove-sdk/releases/download/sdk%2Fv0.14.2/foxglove-v0.14.2-cpp-x86_64-unknown-linux-gnu.zip";
          to = "URL ${sources."data_tamer_tools/foxglove-v0"}";
        }
      ];
    };
    "data_tamer_tools/foxglove-v0" = substituteSource {
      src = fetchzip {
        name = "foxglove-v0-source";
        url = "https://github.com/foxglove/foxglove-sdk/releases/download/sdk%2Fv0.14.2/foxglove-v0.14.2-cpp-x86_64-unknown-linux-gnu.zip";
        hash = "sha256-XRvnaC7SQ507g1GZTXW+7WqnDLfVIzqXQhxwi4vUzzs=";
      };
    };
  });
  meta = {
    description = "Set of tools for using Foxglove with data tamer";
  };
})
