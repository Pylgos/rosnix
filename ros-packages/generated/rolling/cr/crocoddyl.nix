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
  version = "3.2.0-4";
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
        rev = "edc096495869977f468ed41d9c41efb7c11cf22d";
        hash = "sha256-7Dkw1nucG/nUV9Icm6If/2DyMbWc7+fjZGH81+ddP8c=";
      };
    };
  });
  meta = {
    description = "Crocoddyl optimal control library";
  };
})
