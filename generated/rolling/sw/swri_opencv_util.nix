{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  swri_math_util,
}:
let
  sources = rec {
    swri_opencv_util-c7d46bed3e778008cc382894ad1de167a83f44b9 = substituteSource {
      src = fetchgit {
        name = "swri_opencv_util-c7d46bed3e778008cc382894ad1de167a83f44b9-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "c7d46bed3e778008cc382894ad1de167a83f44b9";
        hash = "sha256-cF6WQaI1Jha+yklpXxMNrlyqYLn0Ua1PtuJg/aIucrk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_opencv_util";
  version = "3.7.3-1";
  src = sources.swri_opencv_util-c7d46bed3e778008cc382894ad1de167a83f44b9;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge swri_math_util ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package with commonly used OpenCV functionality.";
  };
}
