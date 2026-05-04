{
  buildCmakePackage,
  console-bridge-vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdfdom-headers,
}:
buildCmakePackage (finalAttrs: {
  pname = "urdfdom";
  version = "6.0.0-2";
  src = finalAttrs.passthru.sources."urdfdom";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ console-bridge-vendor urdfdom-headers ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libconsole-bridge-dev" "tinyxml2" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ console-bridge-vendor urdfdom-headers ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libconsole-bridge-dev" "tinyxml2" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  passthru.sources = mkSourceSet (sources: {
    "urdfdom" = substituteSource {
      src = fetchgit {
        name = "urdfdom-source";
        url = "https://github.com/ros2-gbp/urdfdom-release.git";
        rev = "9c03abd9ac29723603b6a8cbf68a7c395a27245f";
        hash = "sha256-v3vqlM9WeUCH/lyz8O9QaZOEzroPtoIo5u6pQmhNPak=";
      };
    };
  });
  meta = {
    description = "A library to access URDFs using the DOM model.";
  };
})
