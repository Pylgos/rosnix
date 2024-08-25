{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_geometry,
  substituteSource,
}:
let
  sources = rec {
    vision_opencv = substituteSource {
      src = fetchgit {
        name = "vision_opencv-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_geometry ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Packages for interfacing ROS2 with OpenCV, a library of programming functions for real time computer vision.";
  };
}
