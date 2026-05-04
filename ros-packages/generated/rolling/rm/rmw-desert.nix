{
  ament-cmake,
  ament-cmake-ros-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rmw,
  rmw-dds-common,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-runtime-c,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_desert";
  version = "4.0.1-3";
  src = finalAttrs.passthru.sources."rmw_desert";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake rcpputils rcutils rmw rmw-dds-common rosidl-cmake rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp ];
  buildInputs = [ ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-cmake rcpputils rcutils rmw rmw-dds-common rosidl-cmake rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_desert" = substituteSource {
      src = fetchgit {
        name = "rmw_desert-source";
        url = "https://github.com/ros2-gbp/rmw_desert-release.git";
        rev = "4d0014367d43b05951a427c8a5b7b0a70592ebd2";
        hash = "sha256-PCsAetLE1dIWaLvP1bVW0JB0MLkyfcXlQBFUDGHsu9U=";
      };
    };
  });
  meta = {
    description = "Implement the ROS middleware interface using the DESERT protocol stack for underwater communications.";
  };
})
