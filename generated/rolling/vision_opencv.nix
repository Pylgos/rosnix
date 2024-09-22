{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  image_geometry,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    vision_opencv = substituteSource {
      src = fetchFromGitHub {
        name = "vision_opencv-source";
        owner = "ros2-gbp";
        repo = "vision_opencv-release";
        rev = "644863a3ee32533e12bc5ce511a5cdb41ae27620";
        hash = "sha256-PwJir9LBkybRtAwNZwGQr1ZxvFm4f+Id0qbqJNMEokk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vision_opencv";
  version = "4.1.0-1";
  src = sources.vision_opencv;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge image_geometry ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Packages for interfacing ROS2 with OpenCV, a library of programming functions for real time computer vision.";
  };
}
