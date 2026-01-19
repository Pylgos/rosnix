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
  version = "0.1.0-1";
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
        rev = "aa0778c20025a6748e987e9874d0dcc40ba4bf93";
        hash = "sha256-SWFXs6nCoVCugV3rQ5lr2vhNYZ+eCLWT1SW/so3ay6s=";
      };
    };
  });
  meta = {
    description = "URDF descriptions of components offered with Husarion robots";
  };
})
