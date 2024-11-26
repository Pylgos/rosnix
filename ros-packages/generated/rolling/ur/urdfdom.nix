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
  version = "4.0.0-2";
  src = finalAttrs.passthru.sources."urdfdom";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ console-bridge-vendor tinyxml2-vendor urdfdom-headers ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libconsole-bridge-dev" "tinyxml2" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  passthru.sources = mkSourceSet (sources: {
    "urdfdom" = substituteSource {
      src = fetchgit {
        name = "urdfdom-source";
        url = "https://github.com/ros2-gbp/urdfdom-release.git";
        rev = "219e7797dce15141726018c46fc5e22c4b49a23a";
        hash = "sha256-g0ad4Vg+l8H2Pv4suUdF6WseUIeSWbeHIXY+Z5il3hc=";
      };
    };
  });
  meta = {
    description = "A library to access URDFs using the DOM model.";
  };
})
