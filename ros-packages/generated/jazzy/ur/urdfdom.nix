{
  buildCmakePackage,
  console-bridge-vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tinyxml2-vendor,
  urdfdom-headers,
}:
buildCmakePackage (finalAttrs: {
  pname = "urdfdom";
  version = "4.0.2-1";
  src = finalAttrs.passthru.sources."urdfdom";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ console-bridge-vendor tinyxml2-vendor urdfdom-headers ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libconsole-bridge-dev" "tinyxml2" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ console-bridge-vendor tinyxml2-vendor urdfdom-headers ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libconsole-bridge-dev" "tinyxml2" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  passthru.sources = mkSourceSet (sources: {
    "urdfdom" = substituteSource {
      src = fetchgit {
        name = "urdfdom-source";
        url = "https://github.com/ros2-gbp/urdfdom-release.git";
        rev = "3c8022de6c3702ff1e6541e635518fecc2a3296d";
        hash = "sha256-5YnINAwFhRKlTBnC3veuZtSH4rNHlFm2YK0N1Oa18bY=";
      };
    };
  });
  meta = {
    description = "A library to access URDFs using the DOM model.";
  };
})
