{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "microstrain_inertial_description";
  version = "4.7.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ xacro ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_description" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_description-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "98e26bb42fa8105ef76dc98374021fc6495ce68f";
        hash = "sha256-BRrGyg50+SKkbeb/x1dRLZ/+vt/Rhlj892yJrxZPn4g=";
      };
    };
  });
  meta = {
    description = "URDF and stl files for MicroStrain sensors.";
  };
})
