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
  version = "3.2.0-2";
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
        rev = "30dc0bb8b058ab3b910b7e0d0a2748e6bc67c6a0";
        hash = "sha256-T/4KL6w7bhEQzc08wCI35oVtAjFdU1vR+3dYjqwbB/Y=";
      };
    };
  });
  meta = {
    description = "Crocoddyl optimal control library";
  };
})
