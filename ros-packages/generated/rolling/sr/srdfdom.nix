{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-cmake,
  buildAmentCmakePackage,
  console-bridge-vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tinyxml2-vendor,
  urdf,
  urdfdom-headers,
  urdfdom-py,
}:
let
  sources = mkSourceSet (sources: {
    "srdfdom" = substituteSource {
      src = fetchgit {
        name = "srdfdom-source";
        url = "https://github.com/ros2-gbp/srdfdom-release.git";
        rev = "ac9c39d09685dfa5b6094a68cc7ea3a9db9c303b";
        hash = "sha256-O35FLQSyh06uYnSd8k5+YZLWx4rFjxvJdpVS25ieMDo=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "srdfdom";
  version = "2.0.6-1";
  src = finalAttrs.passthru.sources."srdfdom";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ console-bridge-vendor tinyxml2-vendor urdf urdfdom-headers urdfdom-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libconsole-bridge-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Parser for Semantic Robot Description Format (SRDF).";
  };
})
