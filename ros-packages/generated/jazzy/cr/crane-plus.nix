{
  ament-cmake,
  buildAmentCmakePackage,
  crane-plus-control,
  crane-plus-description,
  crane-plus-examples,
  crane-plus-gazebo,
  crane-plus-moveit-config,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crane_plus";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."crane_plus";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ crane-plus-control crane-plus-description crane-plus-examples crane-plus-gazebo crane-plus-moveit-config ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ crane-plus-control crane-plus-description crane-plus-examples crane-plus-gazebo crane-plus-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "crane_plus" = substituteSource {
      src = fetchgit {
        name = "crane_plus-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "6d97b33235d5415eec440f1abba92cb865f81b47";
        hash = "sha256-sUz9HVHmbXzNRaYmpvwmwr5DsAzxzoNn15etuVAFG6c=";
      };
    };
  });
  meta = {
    description = "ROS 2 package suite of CRANE+ V2";
  };
})
