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
  propagatedNativeBuildInputs = [ rclpy soccer-vision-3d-msgs soccer-vision-attribute-msgs visualization-msgs ];
  propagatedBuildInputs = [ rclpy soccer-vision-3d-msgs soccer-vision-attribute-msgs visualization-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "soccer_vision_3d_rviz_markers" = substituteSource {
      src = fetchgit {
        name = "soccer_vision_3d_rviz_markers-source";
        url = "https://github.com/ros2-gbp/soccer_vision_3d_rviz_markers-release.git";
        rev = "adb70b752cfa34bffe4b541238f57734a50aff3c";
        hash = "sha256-69FCCxAxZa6hSkchZAWrsNb7uNruIRhwkIConj14Ue4=";
      };
    };
  });
  meta = {
    description = "Package that converts soccer_vision_3d_msgs to RViz markers";
  };
})
