{
  ament-cmake,
  buildCmakePackage,
  eigenpy,
  eiquadprog,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pinocchio,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "tsid";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."tsid";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake eigenpy eiquadprog pinocchio ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "doxygen" "git" "graphviz" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake eigenpy eiquadprog pinocchio ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "doxygen" "git" "graphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tsid" = substituteSource {
      src = fetchgit {
        name = "tsid-source";
        url = "https://github.com/ros2-gbp/tsid-release.git";
        rev = "fc0335416dcb320c194776bf0df7cebef1018aa5";
        hash = "sha256-3lO8liDhPzs6qXCgJPB7KSMoAcC9II7IF/Tmkqqjr6s=";
      };
    };
  });
  meta = {
    description = "\n    Efficient Task Space Inverse Dynamics (TSID) based on Pinocchio\n  ";
  };
})
