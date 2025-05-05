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
  propagatedNativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "git" ]; };
  propagatedBuildInputs = [ eigenpy eiquadprog pinocchio ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "graphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tsid" = substituteSource {
      src = fetchgit {
        name = "tsid-source";
        url = "https://github.com/ros2-gbp/tsid-release.git";
        rev = "2eedb5b19769b36a7b590deb20b745b5b61e1174";
        hash = "sha256-3lO8liDhPzs6qXCgJPB7KSMoAcC9II7IF/Tmkqqjr6s=";
      };
    };
  });
  meta = {
    description = "Efficient Task Space Inverse Dynamics (TSID) based on Pinocchio";
  };
})
