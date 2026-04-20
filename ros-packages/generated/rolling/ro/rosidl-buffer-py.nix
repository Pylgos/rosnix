{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-buffer,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_buffer_py";
  version = "5.1.4-2";
  src = finalAttrs.passthru.sources."rosidl_buffer_py";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ rosidl-buffer ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" "python3-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ rosidl-buffer ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "python3-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_buffer_py" = substituteSource {
      src = fetchgit {
        name = "rosidl_buffer_py-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "bcfd4aa97549b947987ddc245d922c9500fd3e8a";
        hash = "sha256-iUHpVWVHldpOwrwcyefBikufpou53KKYPJK3uW9sQbc=";
      };
    };
  });
  meta = {
    description = "\n    Python bindings for rosidl::Buffer, providing a Buffer class that\n    supports vendor-specific memory backends (CPU, GPU, custom) for rclpy users.\n  ";
  };
})
