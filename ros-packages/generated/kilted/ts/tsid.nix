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
  version = "1.9.0-1";
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
        rev = "9001115ed38321c3947644eebcb13b35a4f17332";
        hash = "sha256-gw+gl+yFjjZJJUZzN5UIx4FrcFDwGgARYxZCc6CYCuc=";
      };
    };
  });
  meta = {
    description = "\n    Efficient Task Space Inverse Dynamics (TSID) based on Pinocchio\n  ";
  };
})
