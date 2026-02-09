{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tf_tree_terminal";
  version = "2.0.0-3";
  src = finalAttrs.passthru.sources."tf_tree_terminal";
  propagatedNativeBuildInputs = [ geometry-msgs rclpy tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ geometry-msgs rclpy tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tf_tree_terminal" = substituteSource {
      src = fetchgit {
        name = "tf_tree_terminal-source";
        url = "https://github.com/ros2-gbp/tf_tree_terminal-release.git";
        rev = "e8deeeb1a7dbf7d4226373f055c0f074ec9c78fe";
        hash = "sha256-XN3y8sMAoJacZHN5BawA4ziMa3yTNef84t2UxuFodyM=";
      };
    };
  });
  meta = {
    description = "A lightweight ROS 2 utility to visualize the Coordinate Transform (TF) tree directly in the terminal with a folder-style structure.";
  };
})
