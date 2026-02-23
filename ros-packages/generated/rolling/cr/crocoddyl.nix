{
  ament-cmake,
  buildCmakePackage,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  jrl-cmakemodules,
  mkSourceSet,
  pinocchio,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "crocoddyl";
  version = "3.2.0-3";
  src = finalAttrs.passthru.sources."crocoddyl";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake eigenpy jrl-cmakemodules pinocchio ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "coinor-libipopt-dev" "doxygen" "git" "python3" "python3-numpy" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake eigenpy jrl-cmakemodules pinocchio ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "coinor-libipopt-dev" "doxygen" "git" "python3" "python3-numpy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "crocoddyl" = substituteSource {
      src = fetchgit {
        name = "crocoddyl-source";
        url = "https://github.com/ros2-gbp/crocoddyl-release.git";
        rev = "2801a2cc54bfe6dcaca1e44a6b0f0c18a707745e";
        hash = "sha256-RJd+zDr0rQCb8d/2UXtWj219D6I/Jq2wLmITksE/jfU=";
      };
    };
  });
  meta = {
    description = "Crocoddyl optimal control library";
  };
})
