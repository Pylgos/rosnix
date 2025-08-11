{
  ament-cmake,
  ament-cmake-pytest,
  ament-index-python,
  buildAmentCmakePackage,
  depthai-descriptions,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  realsense2-description,
  robotiq-description,
  rosSystemPackages,
  substituteSource,
  ur-description,
  urdf,
  wrapRosQtAppsHook,
  xacro,
  zed-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "husarion_components_description";
  version = "0.0.2-2";
  src = finalAttrs.passthru.sources."husarion_components_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ depthai-descriptions realsense2-description robotiq-description ur-description urdf xacro zed-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ depthai-descriptions realsense2-description robotiq-description ur-description urdf xacro zed-msgs ];
  checkInputs = [ ament-cmake-pytest ament-index-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "husarion_components_description" = substituteSource {
      src = fetchgit {
        name = "husarion_components_description-source";
        url = "https://github.com/ros2-gbp/husarion_components_description-release.git";
        rev = "5b1e4ca2c0e1a79ed3042d15d6e30441e079cdb2";
        hash = "sha256-SbixDOaVwJRaax2v53q8xAgr60EQqtwjp9rvtT8K/58=";
      };
    };
  });
  meta = {
    description = "URDF descriptions of components offered with Husarion robots";
  };
})
