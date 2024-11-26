{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  soccer-vision-3d-msgs,
  soccer-vision-attribute-msgs,
  substituteSource,
  visualization-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "soccer_vision_3d_rviz_markers";
  version = "1.0.0-2";
  src = finalAttrs.passthru.sources."soccer_vision_3d_rviz_markers";
  propagatedBuildInputs = [ rclpy soccer-vision-3d-msgs soccer-vision-attribute-msgs visualization-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "soccer_vision_3d_rviz_markers" = substituteSource {
      src = fetchgit {
        name = "soccer_vision_3d_rviz_markers-source";
        url = "https://github.com/ros2-gbp/soccer_vision_3d_rviz_markers-release.git";
        rev = "0f9e4a04b95b9a0bb158ed0d6529cd8ce72cea53";
        hash = "sha256-69FCCxAxZa6hSkchZAWrsNb7uNruIRhwkIConj14Ue4=";
      };
    };
  });
  meta = {
    description = "Package that converts soccer_vision_3d_msgs to RViz markers";
  };
})
