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
  version = "5.1.0-1";
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
        rev = "879e165c49625458ce84835214a0af206b9276b2";
        hash = "sha256-2K559hjESZ4DW8c7rgMruQa43Xxe5U0PYrZm8EfriGo=";
      };
    };
  });
  meta = {
    description = "A library to access URDFs using the DOM model.";
  };
})
