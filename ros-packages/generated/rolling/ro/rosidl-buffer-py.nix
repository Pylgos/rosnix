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
  version = "5.3.0-1";
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
        rev = "bde691ecec1ce85b3760d4cdd821c51e58ed7320";
        hash = "sha256-HgHHlmAipdsnl5Nd4qnAUo8bYo+LZlHvhBu9aFGfIA8=";
      };
    };
  });
  meta = {
    description = "\n    Python bindings for rosidl::Buffer, providing a Buffer class that\n    supports vendor-specific memory backends (CPU, GPU, custom) for rclpy users.\n  ";
  };
})
